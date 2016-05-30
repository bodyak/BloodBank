class ChangeInspectVisitFields < ActiveRecord::Migration

  def self.up
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_syphilis TYPE integer USING inspect_syphilis::integer")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_hep_b TYPE integer USING inspect_hep_b::integer")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_hep_c TYPE integer USING inspect_hep_c::integer")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_aids TYPE integer USING inspect_aids::integer")
  end

  def self.down
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_syphilis TYPE boolean USING inspect_syphilis::boolean")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_hep_b TYPE boolean USING inspect_hep_b::boolean")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_hep_c TYPE boolean USING inspect_hep_c::boolean")
    Visit.connection.execute("ALTER TABLE visits ALTER COLUMN inspect_aids TYPE boolean USING inspect_aids::boolean")
  end

end