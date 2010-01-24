class CreateMemberProfiles < ActiveRecord::Migration
  def self.up
    create_table :member_profiles do |t|
		t.string	:first_name
		t.string	:last_name
		t.string	:res_address1
		t.string	:res_address2
		t.string	:res_city
		t.string	:res_state
		t.string	:res_country
		t.string	:res_post_code

		t.string	:contact_address1
		t.string	:contact_address2
		t.string	:contact_city
		t.string	:contact_state
		t.string	:contact_country
		t.string	:contact_post_code
		t.string	:picture_url
		t.string	:description

      t.timestamps
    end
	add_index :member_profiles, :first_name
	add_index :member_profiles, :last_name
	add_index :member_profiles, :res_city
	add_index :member_profiles, :res_state
	add_index :member_profiles, :res_country
	add_index :member_profiles, :res_post_code

	add_index :member_profiles, :contact_city
	add_index :member_profiles, :contact_state
	add_index :member_profiles, :contact_country
	add_index :member_profiles, :contact_post_code

  end

  def self.down
    drop_table :member_profiles
  end
end
