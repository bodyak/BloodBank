ActiveScaffold.set_defaults do |config|

  config.ignore_columns.add [:created_at, :updated_at, :deleted_at]

end