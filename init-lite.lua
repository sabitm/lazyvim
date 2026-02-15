-- set lite mode flag
vim.g.lite_mode = true

-- bootstrap lazy
require("config.lazy")

-- additional overrides for lite mode
vim.diagnostic.disable() -- disable diagnostics
vim.o.timeout = false -- wait forever for mapped key sequences
