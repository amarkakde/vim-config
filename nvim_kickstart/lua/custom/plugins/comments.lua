return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      toggler = {
        line = 'gcc', -- Toggle line comment
        block = 'gbc', -- Toggle block comment (can keep as default)
      },
      opleader = {
        line = 'gcc', -- Operator-pending mode mapping for line comments
        block = 'gb', -- Operator-pending mode mapping for block comments
      },
      mappings = {
        basic = true, -- Include basic mappings
        extra = true, -- Include extra mappings
        extended = false, -- Include extended mappings
      },
    }
  end,
}
