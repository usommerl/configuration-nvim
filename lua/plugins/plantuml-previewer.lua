return {
  {
    'weirongxu/plantuml-previewer.vim',
    dependencies = {
      { 'tyru/open-browser.vim' },
      { 'aklt/plantuml-syntax', lazy = false }
    },
    cmd = { 'PlantumlStart', 'PlantumlStop', 'PlantumlOpen', 'PlantumlSave' }
  }
}
