# 项目初始化指南

当一个新项目已经迁移了这套结构：

```text
AGENTS.md
CONTEXT.md
knowledge/
prompts/
docs/adr/
docs/spec/
```

初始化时按下面顺序执行。

## 1. 进入项目目录

```bash
cd /path/to/your-project
```

## 2. 启动 Codex

```bash
codex
```

## 3. 第一条初始化指令

在 Codex 里输入：

```text
请先阅读 AGENTS.md，并按里面的工作流执行。然后阅读 CONTEXT.md、docs/adr/ 和 knowledge/ 目录下已有文件，判断哪些信息缺失，不要开始写代码。请先输出：
1. 当前项目已知信息
2. 缺失信息清单
3. 建议我优先补充哪些 context、ADR 或 knowledge 文件
```

## 4. 新项目或模糊想法从 `/grill-me` 开始

如果已经安装 Matt Pocock skills，优先用：

```text
/grill-me
项目名称：xxx
初始想法：xxx
一次只问一个问题，每个问题先给你的推荐答案。不要开始实现。
```

如果没有安装 `/grill-me`，使用本地 fallback：

```text
请使用 prompts/fallback-grill-me.md 的方式，对我这个项目进行需求拷问。
项目名称：xxx
初始想法：xxx
一次只问一个问题，每个问题先给你的推荐答案。不要开始实现。
```

如果时间有限，可以加限制：

```text
Limit to 10 questions, focus only on architecture decisions.
```

## 5. 已有项目用 `/grill-with-docs`

已有 `CONTEXT.md`、`docs/adr/` 或历史知识库时，优先用：

```text
/grill-with-docs
我想推进：xxx
请基于 CONTEXT.md、docs/adr/ 和 knowledge/ 拷问我。不要重复问文档里已有答案。
```

它适合一边做决策，一边更新领域词汇和 ADR。

如果没有安装 `/grill-with-docs`，使用本地 fallback：

```text
请使用 prompts/fallback-grill-with-docs.md，对这个主题进行带文档的需求拷问：
xxx
```

## 6. 转成 Spec

grill session 结束后，不要清空上下文。直接输入：

```text
/to-spec
```

如果当前环境没有 `/to-spec`，使用本地 fallback：

```text
请使用 prompts/fallback-to-spec.md，把当前对话整理成 spec，并写入 docs/spec/。
不要重新问我一遍，只从当前上下文和项目文件里提取。
```

## 7. 转成 Tickets

spec 通过后，优先用：

```text
/to-tickets
```

如果当前环境没有 `/to-tickets`，使用本地 fallback：

```text
请使用 prompts/fallback-to-tickets.md，把当前 spec 或计划拆成 tracer-bullet tickets。
每个 ticket 要有 Blocked by、What it delivers 和 Acceptance criteria。
```

## 8. 回填知识库

需求问清后输入：

```text
根据刚才确认的需求、spec 和 tickets，请更新 knowledge/01-project-overview.md、knowledge/02-requirements.md 和其他相关 knowledge 文件。
只写已经确认的信息，不确定的放到 Open Questions。领域词汇写入 CONTEXT.md，重要架构决策写入 docs/adr/。
```

## 9. 生成任务清单

```text
请使用 prompts/02-generate-task-list.md，根据 knowledge/ 里的当前内容生成任务清单，并写入 knowledge/04-task-list.md。
不要实现代码。
```

如果已经使用 `/to-tickets` 生成了 tickets，这一步可以跳过，或只把 tickets 摘要同步到 `knowledge/04-task-list.md`。

## 10. 做多角色评审

```text
请分别使用 prompts/03-review-product.md、prompts/04-review-frontend.md、prompts/05-review-backend.md、prompts/06-review-testing.md 审查任务清单。
把审查结果整理到 knowledge/05-review-notes.md。
不要实现代码。
```

## 11. 修订任务清单

```text
根据 knowledge/05-review-notes.md 的审查意见，修订 knowledge/04-task-list.md。
如果有需要我确认的问题，先问我，不要直接猜。
```

## 12. 开始执行

普通执行：

```text
请按照 knowledge/04-task-list.md 中已审核通过的任务清单执行。
每次只做一个任务，完成后说明改了什么、如何验证、下一个任务是什么。
```

Goal 模式执行：

```text
/g goal 请先阅读 AGENTS.md、CONTEXT.md、docs/adr/、docs/spec/ 和 knowledge/ 目录，然后按照 tickets 或 knowledge/04-task-list.md 中已审核通过的任务清单实现本项目。逐个任务执行，每完成一个任务都要验证，并把重要决策和踩坑更新到 knowledge/09-decisions.md、knowledge/10-lessons-learned.md、CONTEXT.md 或 docs/adr/。
```

## 常用入口命令

如果只想记一条命令，用这个：

```text
请先阅读 AGENTS.md、CONTEXT.md、docs/adr/ 和 knowledge/，不要写代码。先帮我检查项目上下文是否足够，然后按 grill -> spec -> tickets -> review -> execute 的流程推进。
```
