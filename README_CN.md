[English](./README.md) | 中文

# 吸血鬼宝宝 v0.0.2版本介绍

## 必要操作：***使用该脚本呢游戏必须全屏，Alt+Enter使游戏全屏***。

## **安装和运行**

### 从Releases中下载压缩包。解压压缩包，直接双击运行VampireBaby.exe，你将会看到Windows工具条出现了H的图标。（如图所示）

### ![Image](https://raw.githubusercontent.com/Waterkuiiiiii/VampireBaby/main/MdPic/ToolBar%20Icon.png)

## **常规功能**

### ***Ctrl+Shift+`：强制退出***

#### 如果脚本失控，可以使用。记住输入法一定得是英文模式，还有 ` 符号在Esc键下面一格。

### ***Ctrl+方向键：赶路好工具***

#### 例子：如果你想要一直往上走，正常情况需要一直按住上方向键或者W键，这样做会非常累，这时候你就可以Ctrl+上方向键，让VampireBaby替你按住这个键。（**开新棺材的时候很有用**）

## ***MissingN FINO功能***

### [***关于MissingN FINO***](https://vampire-survivors.fandom.com/wiki/MissingN%E2%96%AF)

### ***按键映射：解决按键方向与移动方向相反的特性***

#### 由于MissingN的特性是随机数值，因此一旦速度小于-100%那么就会导致按键和移动方向是相反。我将Home键改为下，End改为上，Delete改为右，Page Down改为左。如图所示。

#### ![Image](https://raw.githubusercontent.com/Waterkuiiiiii/VampireBaby/main/MdPic/KeyboardHEDP.png)

### ***Insert：无敌的吸血鬼（~~除了白手~~）*** 此功能目前仅支持1920*1080分辨率并且保证游戏是英语模式

#### 因为MissingN每次开始数值随机，所以是有概率开出负数生命值。（负数生命值，再怎么减都是负数，约等于无敌）但也因为是随机的，有时候需要重开很多很多次，运气不好的时候要开上一两百次。为了解决这个问题，我实现了只需要在***角色选择的界面上***按下Ins(Insert)键就可以全自动刷负血量了。

#### **Ins(Insert)键在图上红圈处。**

#### ![Image](https://raw.githubusercontent.com/Waterkuiiiiii/VampireBaby/main/MdPic/KeyboardIns.png)

#### 血量上限是-2，运气不错只刷了4次。

#### ![Image](https://github.com/Waterkuiiiiii/VampireBaby/blob/main/MdPic/Invicible%20Vampire%20.png?raw=true)

#### ***如何想要强制退出该功能按下键盘上的PgUp键，如图上的红圈处。（本质上是重载脚本）***

#### ![Image](https://raw.githubusercontent.com/Waterkuiiiiii/VampireBaby/main/MdPic/KeyboardPgUp.png)

#### PS：如果你发现Ins键没效果，试一试Ctrl+Ins，虽然刷新速度会慢一点，但是能够在每次循环的时候加上是否有选择上MissingN的判断。