# claude-career（已归档，请改用 claude-skills）

> **这个仓已停止维护，全部功能已并入 [chenyongzhi1119/claude-skills](https://github.com/chenyongzhi1119/claude-skills)。**
> 那边是超集：除了这里的四个职业规划命令，还有日报周报、HTML 汇报胶片与讲稿、代码库走读教学、
> 对抗性代码审查、技术选型与决策存档等共 19 个 skill、5 个 agent，外加同一个学习提醒钩子。
>
> 本仓保持只读，是为了不让已有的链接和 clone 失效。新用户请直接装 claude-skills。

## 迁移方式

先卸载本插件：

```
/plugin uninstall career
```

再装 claude-skills：

```
/plugin marketplace add chenyongzhi1119/claude-skills
/plugin install cn@claude-skills
```

想让命令不带前缀（`/cv` 而不是 `/cn:cv`），用脚本装：

```bash
git clone https://github.com/chenyongzhi1119/claude-skills.git
cd claude-skills && ./install.sh
```

## 命令对照

| 本仓旧命令 | claude-skills 新命令 | 说明 |
|---|---|---|
| `/career:star` | `/cv` | 内容一致，仅改名 |
| `/career:learn` | `/roadmap` | 内容一致，仅改名 |
| `/career:jd` | `/job` | 内容一致，仅改名 |
| `/career:checkin` | `/checkin` | 同名，措辞更通用（不再绑定特定学习方向） |
| `career-mentor` agent | `career-mentor` | 同名，无变化 |
| `hooks/study-reminder.sh` | 同名 | 见新仓 README 的「学习提醒钩子（可选）」章节 |
| `templates/学习进度模板.md` | 同名 | 同上 |

## ⚠️ 数据文件路径变了

新仓统一用 `~/Documents/study/`，本仓用的是 `~/Documents/career/`。已经在打卡的话，迁移前先把文件搬过去：

```bash
mkdir -p ~/Documents/study
mv ~/Documents/career/学习进度.md ~/Documents/study/
mv ~/Documents/career/作业本.md   ~/Documents/study/ 2>/dev/null
```

如果你不想搬，也可以装完之后直接编辑 `~/.claude/skills/checkin/SKILL.md`，把里面的路径改回 `~/Documents/career/`——skill 就是纯 Markdown 提示词，改完保存即生效。

装了 SessionStart 钩子的话，别忘了 `~/.claude/hooks/study-reminder.sh` 里的路径也要跟着一致。

## 为什么归并

本仓的 `star` / `jd` / `learn` 与 claude-skills 的 `cv` / `job` / `roadmap` 是**逐字节相同**的文件，只有 frontmatter 里的 `name` 字段不一样。同一份提示词维护两处，改一边忘另一边，内容只会越来越分叉。收口到一个仓，各位少装一个插件，我少维护一份。

## License

MIT。
