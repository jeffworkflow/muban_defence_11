@echo off
del %cd%\ItemData.ini

chcp 65001 && lua "%cd%\�浵�����Ʒ.lua" >> %cd%\ItemData.ini
pause