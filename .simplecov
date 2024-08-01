SimpleCov.start do
  add_filter '/bin/'
  add_filter '/config/'
  add_filter '/helpers/'
  add_filter '/db/'
  add_filter '/jobs/'
  add_filter '/spec/'
  add_filter '/vendor/'
  add_filter '/mailers/'
  add_filter '/workers/'
  add_filter '/lib/'
  add_filter '/models/abilities/ability.rb'
  add_filter '/controllers/'
  add_filter '/filters/concerns/date_range.rb'
  add_filter '/managers/base_manager.rb'

  add_group 'Models', '/models/'
end
