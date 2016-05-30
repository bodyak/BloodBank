module RailsAdmin
  module Config
    module Fields
      module Types
        class Date < RailsAdmin::Config::Fields::Types::Datetime

          def parse_input(params)
            params[name] = self.class.normalize(params[name], localized_date_format).to_date if params[name].present?
          rescue ArgumentError
            params[name] = nil
          end

        end
      end
    end
  end
end
