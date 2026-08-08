# claude-career

Claude Code 职业规划导师插件：把"项目写进简历、方向找资料、岗位差距分析、学习打卡监督"四件事装进你的终端。

## 安装

在 Claude Code 会话里输入：

```
/plugin install https://github.com/chenyongzhi1119/claude-career.git
```

或在终端：

```bash
claude plugin install https://github.com/chenyongzhi1119/claude-career.git
```

## 功能

| 命令 | 用途 |
|---|---|
| `/career:star [项目路径]` | 深入分析本地项目（源码、依赖、git 历史），生成 STAR 法则简历描述：简历版 bullet + 面试口述版 + 面试官追问预判。量化数据缺失会标注【请补充】，绝不编造 |
| `/career:learn <方向>` | 联网检索该方向当前优质入门资料（不凭记忆推荐），按官方文档/课程/书籍/实战分类，附最小可行学习路径和验收标准 |
| `/career:jd <岗位>` | 检索 3-5 份真实招聘 JD，归纳能力矩阵——把空泛的"熟悉/精通"翻译成可检验标准，并结合你的现状做差距分析 |
| `/career:checkin` | 学习打卡：记录进度、对照计划给出带资料链接的下一步、落后时帮你把任务砍小、偶尔出验收题 |

另含 `career-mentor` 子代理：自然语言提到简历、求职、学习路线时自动委派。

## checkin 与提醒钩子的初始化

打卡功能依赖进度文件 `~/Documents/career/学习进度.md`：

1. 把 `templates/学习进度模板.md` 复制到 `~/Documents/career/学习进度.md`
2. 填上你自己的阶段、计划表和资源地图（或直接让 Claude 帮你生成）
3. 之后每次打开 Claude Code，SessionStart 钩子会按上次打卡日期提醒你（3 天提示、7 天警告）；文件不存在时钩子静默跳过

## 卸载

```
/plugin uninstall career
```
