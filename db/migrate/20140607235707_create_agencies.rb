class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.float :latitude
      t.float :longitude
      t.string :agency_ref
      t.string :agency
      t.string :program
      t.string :agency_type_id
      t.string :type
      t.string :hours
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :contact
      t.string :e_mail
      t.string :county
      t.boolean :open_sun_am
      t.boolean :open_sun_pm
      t.boolean :open_mon_am
      t.boolean :open_mon_pm
      t.boolean :open_tue_am
      t.boolean :open_tue_pm
      t.boolean :open_wed_am
      t.boolean :open_wed_pm
      t.boolean :open_thr_am
      t.boolean :open_thr_pm
      t.boolean :open_fri_am
      t.boolean :open_fri_pm
      t.boolean :open_sat_am
      t.boolean :open_sat_pm

      t.timestamps
    end
  end
end
