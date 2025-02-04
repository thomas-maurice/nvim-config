return {
  drop = {
    -- drop all the buf_ls messages
    buf_ls = {},
    -- drop pylint messages, they are very noisy
    pylsp = { "lint:" },
  },
}
