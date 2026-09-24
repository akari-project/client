# SPDX-License-Identifier: GPL-3.0-or-later
#
# client 的检查（spec/42 42.2）。本地与 CI 执行同一目标：make ci。
# 客户端在 1.0 之后开发，目前只有 SPDX 头与依赖许可证两项；REUSE lint 由 CI 的 reuse 任务执行。

SHELL := /usr/bin/env bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := ci

GO_LICENSES_VERSION := v2.0.1
# spec/42 42.2：GPL-3.0 仓库的允许清单。
ALLOWED_LICENSES := MIT,BSD-2-Clause,BSD-3-Clause,Apache-2.0,ISC,MPL-2.0,LGPL-2.1,LGPL-3.0,GPL-3.0

.PHONY: ci check-spdx licenses

ci: check-spdx licenses

# 已跟踪文件前两行内必须有 SPDX 标识（CONV-25）；REUSE.toml 中登记的文件与 LICENSES/ 除外。
check-spdx:
	@missing="$$(git ls-files | grep -v -E '^(LICENSES/|CLAUDE\.md$$|\.claude/)' \
	  | while read -r f; do head -n 2 "$$f" | grep -q 'SPDX-License-Identif[i]er:' || echo "$$f"; done)"; \
	if [ -n "$$missing" ]; then echo "缺少 SPDX 头："; echo "$$missing"; exit 1; fi; \
	echo "check-spdx: 通过"

# 依赖许可证扫描。尚无 go.mod 时跳过；前端依赖加入时在此补充对应的扫描。
licenses:
	@if [ ! -f go.mod ]; then echo "licenses: 尚无依赖，跳过"; exit 0; fi; \
	go run github.com/google/go-licenses/v2@$(GO_LICENSES_VERSION) check ./... \
	  --allowed_licenses=$(ALLOWED_LICENSES) --ignore github.com/akari-project/client
