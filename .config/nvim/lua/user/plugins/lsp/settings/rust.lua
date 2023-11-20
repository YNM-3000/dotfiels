return {
	capabilities = {
		textDocument = {
			inlayHint = {
				dynamicRegistration = true,
				resolveSupport = {
					properties = {
						bindingModeHints = {
							enable = true,
						},
						expressionAdjustmentHints = {
							enable = true,
						},
					},
				},
			},
		},
	},
}
