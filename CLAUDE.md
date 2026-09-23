# client（预留，1.0 之后）

自研客户端，内嵌 mihomo，GPL-3.0-or-later。规格：spec/30（API-03 至 API-09）。

- 只使用 panel-spec 发布的 SDK 与 `/v1` 接口。
- API-08 从 `/v1/me/configuration` 在本地生成 mihomo 配置，与控制面 mihomo 导出适配器共用 golden 数据。
- API-09 只连接 sing-box 内核节点上的 Reality 入站。
- 启动配置（`/v1/config`）必须验签；令牌存系统安全存储。
- API-05 支付：渲染订单返回的支付宝二维码或调起支付宝。
