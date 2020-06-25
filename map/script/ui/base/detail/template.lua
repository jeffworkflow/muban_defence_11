load_fdf [[
IncludeFile "UI\FrameDef\Glue\StandardTemplates.fdf",
IncludeFile "UI\FrameDef\Glue\BattleNetTemplates.fdf",

Frame "TEXTBUTTON" "ChooBlankButtonTemplatetA" {
    ControlStyle "AUTOTRACK",
}

//背景模板
Frame "BACKDROP" "panel" {
	BackdropBackground  "Transparent.tga",
	//BackdropBlendAll,
}
//按钮模板
Frame "GLUETEXTBUTTON" "buttonAAA" {
  SetAllPoints,
}

//字
Frame "TEXT" "text" {
    LayerStyle "IGNORETRACKEVENTS",
    FrameFont "fonts\fonts.TTF", 10, "", 
}

Frame "SPRITE" "model" {
    BackgroundArt "HeroShadowHunter2.mdx",
    //SetAllPoints,
}

Frame "TEXT" "old_text" {
    LayerStyle "IGNORETRACKEVENTS",
    FrameFont "MasterFont", 1, "", 
}

Frame "BACKDROP" "tooltip_backdrop" {
    UseActiveContext,
    BackdropTileBackground,
    BackdropBackground  "UI\widgets\BattleNet\bnet-tooltip-background.blp",
    BackdropCornerFlags "UL|UR|BL|BR|T|L|B|R",
    BackdropCornerSize  0.01,
    BackdropBackgroundInsets 0.001f 0.001f 0.001f 0.001f,
    BackdropEdgeFile  "UI\Widgets\BattleNet\bnet-inputbox-border.blp",
}

Frame "BACKDROP" "item_count" {
    UseActiveContext,
    BackdropTileBackground,
    BackdropBackground  "UI\Widgets\ToolTips\Human\human-tooltip-background.blp",
    BackdropCornerFlags "UL|UR|BL|BR|T|L|B|R",
    BackdropCornerSize  0.01,
    BackdropBackgroundInsets 0.001f 0.001f 0.001f 0.001f,
    BackdropEdgeFile  "UI\Widgets\ToolTips\Human\human-tooltip-border.blp",
}

Frame "BACKDROP" "BuffTooltipBackdrop" {
    UseActiveContext,
    BackdropTileBackground,
    BackdropBackground  "UI\widgets\BattleNet\bnet-tooltip-background.blp",
    BackdropCornerFlags "UL|UR|BL|BR|T|L|B|R",
    BackdropCornerSize  0.006,
    BackdropBackgroundInsets 0.001f 0.001f 0.001f 0.001f,
    BackdropEdgeFile  "image\buffArt\buff-tooltip-border.blp",
}

Frame "BACKDROP" "item_tip_backdrop" {
    UseActiveContext,
    BackdropTileBackground,
    BackdropBackground  "image\black.tga",
    BackdropCornerFlags "UL|UR|BL|BR|T|L|B|R",
    BackdropCornerSize  0.01,
    BackdropBackgroundInsets 0.001f 0.001f 0.001f 0.001f,
    BackdropEdgeFile  "image\fa_mtp.tga",
    BackdropBlendAll,
}

Frame "TEXTAREA" "item_tip" {
    FrameFont "fonts\fonts.TTF", 0.009, "", 
    TextAreaLineHeight 0.015,
    TextAreaLineGap 0.003,
    TextAreaInset 0.0,
    TextAreaMaxLines 128,
    Width 0.2,
    Height 0.1,
    LayerStyle "IGNORETRACKEVENTS",
}
]]