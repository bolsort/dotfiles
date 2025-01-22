return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/notes/**/*',
      org_default_notes_file = '~/notes/refile.org',
    })
  end,
}
