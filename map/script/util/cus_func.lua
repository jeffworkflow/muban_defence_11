
--循环打印 table
function print_r (lua_table, indent)
	if type(lua_table) == "string" then 
		print(lua_table)
		return
	end
    indent = indent or 0
    for k, v in pairs(lua_table) do
        if type(k) == "string" then
            k = string.format("%q", k)
        end
        local szSuffix = ""
        if type(v) == "table" then
            szSuffix = "{"
        end
        local szPrefix = string.rep("    ", indent)
        formatting = szPrefix.."["..k.."]".." = "..szSuffix
        if type(v) == "table" then
            print(formatting)
            print_r(v, indent + 1)
            print(szPrefix.."},")
        else
            local szValue = ""
            if type(v) == "string" then
                szValue = string.format("%q", v)
            else
                szValue = tostring(v)
            end
            print(formatting..szValue..",")
        end
    end
end

--字符串是否包含 字符串 字符串 字符串 模糊匹配
function finds(str,...)
	local flag = false
	
	for key , value in sortpairs{...} do
		local _, q=string.find(str, value)
		if _ then 
			flag= true
			break
		end	
	end
	return flag
end
--字符串是否包含 字符串 字符串 字符串 全等匹配
function _in(str,...)
	local flag = false
	if type(...) == 'table' then 
		for key , value in sortpairs(...) do
			local _ = str == value and true or false
			if _ then 
				flag= true
				break
			end	
		end
	else
		for key , value in sortpairs{...} do
			local _ = str == value and true or false
			if _ then 
				flag= true
				break
			end	
		end
	end
	return flag
end
--获取字符串 字数
function get_font_count(str)
	local count = 0
	local len = str:len()
	local a = 0
	for i=1,len do
		local s = str:sub(i,i)
		if s:byte() < 128 then

			count = count + 1
		else
			a = a + 1
			if a == 3 then
				a = 0
				count = count + 1
			end
		end
	end

	return count
end

-- 获取字符串中最长的一行
function get_max_line(str)
	--去掉颜色代码
	str = str:gsub('|[cC]%w%w%w%w%w%w%w%w(.-)|[rR]','%1'):gsub('|n','\n'):gsub('\r','\n')

	local count = 0
	local max_line

	str:gsub('([^\n]-)\n',function (line)
		if line:len() > count then
			max_line = line
			count = line:len()
		end
	end)
	
	return max_line
end 
-- 去掉颜色代码
function clean_color(str)
	str = str:gsub('|[cC]%w%w%w%w%w%w%w%w(.-)|[rR]','%1'):gsub('|n','\n'):gsub('\r','\n')
    return str
end    


--获取路径
function stripfilename(filename)
	-- return string.match(filename, "(.+)/[^/]*%.%w+$") --*nix system
	return string.match(filename, "(.+)\\[^\\]*%.%w+$") -- windows
end
 
--获取文件名
function strippath(filename)
	-- return string.match(filename, ".+/([^/]*%.%w+)$") -- *nix system
	return string.match(filename, ".+\\([^\\]*%.%w+)$") -- *windows system
end
 
--去除扩展名
function stripextension(filename)
	local idx = filename:match(".+()%.%w+$")
	if(idx) then
		return filename:sub(1, idx-1)
	else
		return filename
	end
end
 
--获取扩展名
function getextension(filename)
	return filename:match(".+%.(%w+)$")
end


--根据table sortkey 排序，取key对应的最大值
function get_maxtable(tab,sortkey,key)
	table.sort(tab,function (a,b)
		return a[sortkey] > b[sortkey]
	end) 
	return tab[1][key]
end
--根据table sortkey 排序，取key对应的最大值
function get_mintable(tab,sortkey,key)
	table.sort(tab,function (a,b)
		return a[sortkey] < b[sortkey]
	end) 
	return tab[1][key]
end
--数字转换 bignum2string bignum2string
function bignum2string(value)
	local value = tonumber(value)
	if type(value) == 'string' then 
		return 
	end	
    if value < 10000 then
        return math.tointeger(value) or ('%.2f'):format(value)
	elseif value < 100000000 then
        return value % 10000 == 0 and ('%.0f'):format(value/10000)..'万' or ('%.1f'):format(value/10000)..'万'
    else
        return value % 100000000 == 0 and ('%.0f'):format(value/100000000)..'亿' or ('%.1f'):format(value/100000000)..'亿'
    end
end


--二进制开关，是否拥有***
function has_flag(flag, bit)
	return flag % (bit * 2) - flag % bit == bit
end

--输入10,去转为二进制后，最大的数
function maxbit2num(n)
	for i=100,0,-1 do 
		local t = math.floor(n / 2^i)
		if t >0 then 
			return tonumber(string.format("%.f",2^i))
		else 	
    		n = n % 2^i
		end	
	end	
end	
--把换行 换成 空格
function tran_space(s) 
	return (string.gsub(s, "[\r\n]+", " "))
end

--取得 table key 最大的数
function table.maxnum(tab) 
	local max_cnt =0
	for k,v in pairs(tab) do 
		if type(k) == 'number' and k>=max_cnt then 
			max_cnt = k
		end
	end
	return max_cnt
end