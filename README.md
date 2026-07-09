# WF Skills

一套给 Codex 使用的个人工作流 skills。

目标是把「先拷问想法 -> 写 spec -> 拆 tickets -> 按 ticket 执行 -> 回填知识库」这套流程做成可迁移的 skills 仓库。换电脑时只需要 clone 仓库并运行安装脚本，不需要复制粘贴 prompt。

## 包含的 Skills

- `wf-setup`：在项目里初始化工作流结构。
- `wf-grill`：拷问模糊想法，适合新项目、产品想法、文章、课程、工作流等非代码或代码场景。
- `wf-docgrill`：基于项目文档拷问已有项目变更，并在需要时更新 `CONTEXT.md` 和 `docs/adr/`。
- `wf-spec`：把当前对话整理成本地 spec。
- `wf-tickets`：把 spec 或计划拆成带依赖关系的本地 tickets。
- `wf-exec`：按未阻塞的 ticket 执行，每次一个闭环，验证后回填知识库。

## 安装

克隆仓库后运行：

```bash
./scripts/install.sh
```

安装脚本会把 `skills/wf-*` 软链接到：

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

安装完成后重启 Codex，让新的 skills 生效。

## 手动安装

如果不想运行脚本，也可以手动软链接：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
ln -s "$PWD/skills/wf-setup" "${CODEX_HOME:-$HOME/.codex}/skills/wf-setup"
ln -s "$PWD/skills/wf-grill" "${CODEX_HOME:-$HOME/.codex}/skills/wf-grill"
ln -s "$PWD/skills/wf-docgrill" "${CODEX_HOME:-$HOME/.codex}/skills/wf-docgrill"
ln -s "$PWD/skills/wf-spec" "${CODEX_HOME:-$HOME/.codex}/skills/wf-spec"
ln -s "$PWD/skills/wf-tickets" "${CODEX_HOME:-$HOME/.codex}/skills/wf-tickets"
ln -s "$PWD/skills/wf-exec" "${CODEX_HOME:-$HOME/.codex}/skills/wf-exec"
```

## 初始化项目

进入目标项目后，在 Codex 里使用：

```text
$wf-setup
```

`wf-setup` 默认使用 minimal 模式，不覆盖已有文件。

minimal 结构包括：

```text
AGENTS.md
CONTEXT.md
knowledge/
docs/
  adr/
  spec/
```

如果需要完整模板，可以在调用时说明：

```text
$wf-setup 使用 full 模式初始化当前项目
```

full 模式会额外包含 fallback prompts、初始化指南，以及 API / 数据库 / 测试策略等知识库模板。

## 推荐流程

新想法：

```text
$wf-grill
$wf-spec
$wf-tickets
$wf-exec
```

已有项目：

```text
$wf-docgrill
$wf-spec
$wf-tickets
$wf-exec
```

如果只是初始化项目结构：

```text
$wf-setup
```

## 和 Matt Pocock Skills 的关系

这套 skills 借鉴了 Matt Pocock 的工作流，但默认更偏个人本地项目：

- 默认中文。
- 默认本地文件优先。
- 默认不发布到 GitHub Issues / Linear。
- 默认使用 `CONTEXT.md`、`knowledge/`、`docs/adr/`、`docs/spec/` 和 `tickets.md` 沉淀上下文。

大致对应关系：

```text
wf-grill     ~= grill-me + 中文/非编程默认
wf-docgrill  ~= grill-with-docs + 本地知识库路径
wf-spec      ~= to-spec + 本地 docs/spec 优先
wf-tickets   ~= to-tickets + 本地 tickets.md 优先
wf-exec      ~= implement + blocker 检查 + 知识库回填
wf-setup     ~= setup + 项目结构初始化
```

## 开发与验证

运行测试：

```bash
bash tests/test-init-project.sh
bash tests/test-install.sh
```

校验 skill 元数据：

```bash
for skill in skills/wf-*; do
  python "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" "$skill"
done
```

检查 Codex 是否能看到 skills：

```bash
codex debug prompt-input 'Use $wf-setup to initialize this project.' | rg 'wf-'
```

## 上传远端仓库

创建远端仓库后：

```bash
git remote add origin git@github.com:<your-name>/wf-skills.git
git push -u origin main
```

