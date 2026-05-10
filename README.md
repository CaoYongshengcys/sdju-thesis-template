# 上海电机学院 LaTeX 学位论文模板 (SDJUThesis)

> 本项目是上海电机学院学位论文（<font color="red">非官方</font>）LaTeX 模板文档，支持**本科毕业设计（论文）**和**硕士学位论文**两种类型。

## 项目介绍

&emsp;&emsp; 本项目基于 LaTeX 语法编写，模板格式参考了《上海电机学院本科毕业设计（论文）工作手册》和《上海电机学院硕士学位论文与摘要的统一要求》。

&emsp;&emsp; 本模板包含本科和硕士两套完整模板，用户可根据学位类型选择对应的模板目录。模板中包含了排版中常用的示例，包括公式、表格、算法、参考文献等，用户可以参考或者直接基于此撰写论文。

## 模板目录结构

- `sdju-thesis-template/` — **本科毕业设计（论文）模板**
- `sdju-thesis-master/` — **硕士学位论文模板**

### 本科模板目录

```
sdju-thesis-template/
├── images/                          # 校徽等图片
├── figures/                         # 论文插图目录
├── tex/                             # 论文内容目录
│   ├── sdju-information.tex         # 信息录入（必须填写）
│   ├── sdju-abstract.tex            # 中英文摘要
│   ├── sdju-introduction.tex        # 第一章 绪论
│   ├── sdju-chapter2.tex            # 第二章
│   ├── sdju-chapter3.tex            # 第三章
│   ├── sdju-chapter4.tex            # 第四章
│   ├── sdju-chapter5.tex            # 第五章
│   ├── sdju-conclusion.tex          # 总结与展望
│   ├── sdju-acknowledgements.tex    # 致谢
│   ├── sdju-appendix.tex            # 附录
│   └── sdju-body.tex                # 正文示例
├── sdju-main.tex                    # 论文主体文件
├── sdju-thesis.bib                  # 参考文献
├── sdjuthesis.cls                   # 文档类
├── sdjuthesis.sty                   # 宏包
├── sdjuthesis-bachelor.ltx          # 本科模板配置
└── sdjuthesis-master.ltx            # 硕士模板配置
```

### 硕士模板目录

```
sdju-thesis-master/
├── images/                          # 校徽等图片
├── tex/                             # 论文内容目录
│   ├── sdju-information.tex         # 信息录入（必须填写）
│   ├── sdju-abstract.tex            # 中英文摘要
│   ├── sdju-introduction.tex        # 第一章 绪论
│   ├── sdju-chapter2.tex            # 第二章
│   ├── sdju-chapter3.tex            # 第三章
│   ├── sdju-chapter4.tex            # 第四章
│   ├── sdju-chapter5.tex            # 第五章
│   ├── sdju-conclusion.tex          # 总结与展望
│   ├── sdju-acknowledgements.tex    # 致谢
│   ├── sdju-appendix.tex            # 附录
│   └── sdju-achievements.tex        # 攻读学位期间取得的成果
├── sdju-main.tex                    # 论文主体文件
├── sdju-thesis.bib                  # 参考文献
├── sdjuthesis.cls                   # 文档类
├── sdjuthesis.sty                   # 宏包
├── sdjuthesis-bachelor.ltx          # 本科模板配置
└── sdjuthesis-master.ltx            # 硕士模板配置
```

## 环境依赖

&emsp;&emsp; 本模板仅支持 XeTeX 引擎——XeLaTeX，字符编码仅支持 UTF-8。

## 使用方法

> 编译设置：排版引擎（Typeset Engine）设置为 `XeLaTeX`；文献引擎（Bibliography Engine）设置为 `Biber`。

### 快速开始

1. 选择对应的模板目录（本科：`sdju-thesis-template/`，硕士：`sdju-thesis-master/`）；
2. 编辑 `tex/sdju-information.tex` 填写论文信息；
3. 编辑 `tex/` 下各章节文件撰写论文内容；
4. 将论文插图放入 `figures/` 目录；
5. 编译 `sdju-main.tex` 生成 PDF。

### macOS 用户

&emsp;&emsp; 推荐下载 [texpad](https://www.texpad.com/)、[texlive](https://www.tug.org/texlive/) 或其他 LaTeX 编辑器，也可以使用 `compile.sh` 脚本编译。以 texpad 为例：

1. 打开 `sdju-main.tex`；
2. 将 Typesetter 修改为 `External Typesetter`；
3. 设置 Typeset Engine 为 `XeLaTeX`，Bibliography Engine 为 `Biber`；
4. 点击编译。

### Linux 用户

1. 安装 `latexmk` 和 `biber`：`sudo apt-get install latexmk biber`；
2. 在模板目录下运行 `./compile.sh run`。

#### VSCode 编辑器

1. 安装 `Latex WorkShop` 插件；
2. 在 `settings.json` 中配置：
  ``` json
  "latex-workshop.latex.tools": [{
    "name": "biber",
    "command": "biber",
    "args": ["%DOCFILE%"]
  }],
  "latex-workshop.latex.recipes": [{
    "name": "xe->bib->xe->xe",
    "tools": ["xelatex", "biber", "xelatex", "xelatex"]
  }]
  ```
3. 打开 `sdju-main.tex`，选择 `Recipe: xe->bib->xe->xe` 编译。

### Windows 用户

1. 安装 [Texlive](https://www.tug.org/texlive/) 和 [TeXstudio](https://sourceforge.net/projects/texstudio/)；
2. 在 TeXstudio 中设置编译器为 XeLaTeX，文献工具为 Biber；
3. 打开 `sdju-main.tex`，点击构建并查看。

## 学位类型切换

模板通过 `degree` 选项控制学位类型：

- 本科：`\documentclass[degree=bachelor]{sdjuthesis}`
- 硕士：`\documentclass[degree=master]{sdjuthesis}`

## 字体说明

如果编译过程中出现 XITS、LISU 和 YOUYUAN 字体缺失错误，请在 `fonts` 目录中安装字体。

## 问题反馈

如果在使用上有任何问题或者改进建议，请在 [Issues](https://github.com/CaoYongshengcys/sdju-thesis-template/issues) 中提出。

## 致谢

- 感谢 LaTeX 开源项目组；
- 感谢 [CTeX-kit](https://github.com/CTeX-org/ctex-kit) 提供了 LaTeX 的中文支持；
- 感谢上海交通大学 [sjtug](https://github.com/sjtug) 项目组提供的开源模板，为本模板提供了基础代码。

## 软件许可证

- 本项目中所使用到的上海电机学院校徽、校名图片（`sdju-badge.png` 等）的版权归上海电机学院所有；
- `sdjuthesis.cls` 文档类与相关附属文件使用 [LPPL](https://www.latex-project.org/lppl.txt) 授权；
- 其他部分使用 [Apache License 2.0](https://github.com/CaoYongshengcys/sdju-thesis-template/blob/main/LICENSE) 授权。
