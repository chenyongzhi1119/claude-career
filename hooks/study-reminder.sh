#!/bin/bash
# SessionStart hook: 学习进度提醒（读取 ~/Documents/career/学习进度.md）
exec /usr/bin/env python3 - <<'PYEOF'
import json, re, datetime, pathlib
f = pathlib.Path.home() / "Documents/career/学习进度.md"
if not f.exists():
    raise SystemExit(0)
text = f.read_text(encoding="utf-8")
m = re.search(r"## 当前状态\n(.*?)(?=\n## |\Z)", text, re.S)
status = m.group(1).strip() if m else ""
d = re.search(r"上次打卡[:：]\s*(\d{4}-\d{2}-\d{2})", text)
msg, days = "📚 学习进度提醒：/checkin 可打卡", None
if d:
    days = (datetime.date.today() - datetime.date.fromisoformat(d.group(1))).days
    if days >= 7:
        msg = f"⚠️ 已经 {days} 天没有学习打卡了！推理引擎计划还在等你——输入 /checkin 打卡或看下一步"
    elif days >= 3:
        msg = f"📚 距上次学习打卡已 {days} 天，本周目标别忘了（/checkin 打卡）"
    else:
        msg = f"📚 学习进度正常（{days} 天前打过卡），/checkin 查看下一步"
ctx = (
    "用户的推理引擎学习进度（SessionStart hook 注入）：\n" + status
    + (f"\n距上次打卡 {days} 天。" if days is not None else "")
    + "\n提醒规则：若 ≥7 天未打卡，在本次会话中找合适时机主动提醒用户学习；"
      "用户说“打卡”“学习进度”“我学完了 XX”时，调用 checkin 技能。"
)
print(json.dumps({
    "systemMessage": msg,
    "hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": ctx},
}, ensure_ascii=False))
PYEOF
