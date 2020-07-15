class Question < ApplicationRecord
    require 'csv'

    def self.import(file)
        csvdata = CSV.foreach(file.path, headers: true)
        mappings = csvdata.pluck("Mapping").uniq
        roles = csvdata.pluck("Role").uniq
        roles.each do |role|
            if Role.find_by_name(role).nil?
                Role.create(:name=> role)
            end
        end
        mappings.each do |mapping|
            if Mapping.find_by_name(mapping).nil?
                Mapping.create(:name=>mapping)
            end
        end
        CSV.foreach(file.path, headers: true) do |row|
            role = Role.find_by_name(row["Role"])
            mapping = Mapping.find_by_name(row["Mapping"])
            Question.create(:pri=> row["Pri"], :question=> row["Question"], :teaming_stages=> row["Teaming Stages"], :appears=> row["Appears (Day)"],:frequency=> row["Frequency"],:question_type=> row["Type"],:condiqtions=> row["Conditions"],:role_id=> role.id, :mapping_id=> mapping.id)
        end
    end
end
