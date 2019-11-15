local mt = ac.skill['魔瞳·哪吒天赋']
mt{
    --必填
    is_skill = true,
    --初始等级
    level = 1,
    --最大等级
   max_level = 5,
    --触发几率
   chance = function(self) return 10*(1+self.owner:get('触发概率加成')/100) end,
    --伤害范围
   damage_area = 800,
	--技能类型
	skill_type = "天赋",
	--被动
	passive = true,
	--伤害
	damage = function(self)
  return ((self.owner:get('力量')+self.owner:get('智力')+self.owner:get('敏捷'))*600+10000)* self.level
end,
	--属性加成
 ['杀怪加全属性'] = 8888,
 ['攻击减甲'] = 8888,
 ['攻击间隔'] = -1,
 ['暴击几率'] = 50,
 ['技暴几率'] = 50,
 ['会心几率'] = 50,
 ['全伤加深'] = 8888,
 ['力量%'] = 500,
 ['敏捷%'] = 500,
 ['智力%'] = 500,

	--介绍
	tip = [[|cffffff00【全属性】+500%
【杀怪加全属性】+8888
【攻击减甲】+8888
【攻击间隔】-1
【全伤加深】+8888%
【所有暴击的几率】+50%

|cff00bdec【被动效果1】攻击10%几率造成超大范围技能伤害（伤害公式：全属性*600*Lv）
【被动效果2】唯一被动-不灭：死亡后原地1秒重生

|cff00ff00【凌波微步】按D向鼠标方向飘逸500码距离|r]],
	--技能图标
	art = [[nezha.blp]],
	--特效
	effect = [[Abilities\Spells\Orc\Shockwave\ShockwaveMissile.mdl]],
	effect1 = [[ShockwaveMissile.mdx]],
	cool=1
}
function mt:on_add()
    local skill = self
	local hero = self.owner
	
	--添加重生技能
	local skl1 = hero:add_skill('重生','隐藏')
	if skl1 then 
		skl1.cnt = 99999999
		skl1.time = 1
	end	

	local function  mvr_damage(data)
		local mvr = ac.mover.line
		{
			source = hero,
			start = data.start,
			skill = skill,
			model =  data.model,
			speed = 5000,
			angle = data.angle,
			hit_area = 250,
			distance = data.distance,
			high = 120,
			size = data.size
		}
		if mvr then
			function mvr:on_hit(u)
				u:damage
				{
					source = hero,
					skill = skill,
					target = u,
					damage = skill.damage,
					damage_type = skill.damage_type,
				}
				u:damage
				{
					source = hero,
					skill = skill,
					target = u,
					damage = u:get('生命上限') * 0.005,
					real_damage = true,
				}
				
			end

			function mvr:on_remove()
				if timer then
					timer:remove()
				end
			end
		end
	end
	self.trg = hero:event '造成伤害效果' (function(_,damage)
		if not damage:is_common_attack()  then 
			return 
		end 
		--技能是否正在CD
        if skill:is_cooling() then
			return 
		end 
        --触发时修改攻击方式
		if math.random(100) <= self.chance then
			--创建特效
			local start_angle = math.random(360)
			for i=1,8 do 
				local angle = start_angle + 360/8*(i-1)
				if i%2 == 1 then 
					local data = {
						angle = angle,
						start = hero:get_point(),
						model = skill.effect,
						distance = 5000,
						size = 1.5,
					}
					mvr_damage(data)
				else 
					ac.wait(0.2*1000,function()
						local data = {
							angle = angle,
							start = hero:get_point(),
							model = skill.effect1,
							distance = 5000,
							size = 1.5,
						}
						mvr_damage(data)
					end)
				end	
			end	

			ac.wait(0.8*1000,function()
				--创建特效
				local start_angle = math.random(360)
				for i=1,8 do 
					local angle = start_angle + 360/8*(i-1)
					local new_point = damage.target:get_point() - {angle,2500}
					if i%2 == 1 then 
						local data = {
							angle = new_point/damage.target:get_point(),
							start = new_point,
							model = skill.effect,
							distance = 5000,
							size = 1.5,
						}
						mvr_damage(data)
					else 
						ac.wait(0.2*1000,function()
							local data = {
								angle = new_point/damage.target:get_point(),
								start = new_point,
								model = skill.effect1,
								distance = 5000,
								size = 1.5,
							}
							mvr_damage(data)
						end)
					end	
				end	
			end)
			
            --激活cd
            skill:active_cd() 
        end
    end)
end
function mt:on_remove()
    local hero = self.owner
    if self.trg then
        self.trg:remove()
        self.trg = nil
    end
end
