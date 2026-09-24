<!-- SPDX-License-Identifier: GPL-3.0-or-later -->

# client

akari-project 的自研客户端，内嵌 mihomo，许可证 GPL-3.0-or-later。

**状态：预留。** 客户端在控制面 1.0 发布之后开发；在此之前本仓库只有 CI 骨架，用户使用第三方客户端导入配置。

- 只使用 [panel-spec](https://github.com/akari-project/panel-spec) 发布的 SDK 与 `/v1` 接口。
- 开发约定见 `CLAUDE.md`，规格见 workspace 仓库的 `spec/30`（API-03 至 API-09）。

## 检查

```bash
make ci
```

目前包含 SPDX 头检查与依赖许可证扫描（尚无依赖时跳过）；REUSE lint 由 CI 执行。

部署与使用者需遵守所在地的法律法规。
