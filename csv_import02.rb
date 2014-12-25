require 'csv'

# Import a csv file into table vlans
# Check to see if the VLAN already exists in the database. if it does,
# it will then attempt to update the existing VLAN. If not, 
# it will attempt to create a new VLAN.

#file = "vlans_import20141202.csv"
file = "vlan_importing_template.csv"
def import(file, options = {})
	CSV.foreach(file, headers: true) do |row|
		puts "row is type of #{row.class}"
		vlan_hash = row.to_hash
		# Add lan_id key & value
		#vlan_hash[:lan_id] = options[:lan_id]
		#vlan = Vlan.where(id: vlan_hash["id"])
		puts vlan_hash
		
      #~ if vlan.count == 1
        #~ vlan.first.update_attributes(vlan_hash)
      #~ else
        #Vlan.create!(:lan_id => 12, vlan_hash)
        #Vlan.create!(vlan_hash)
    end
end

import(file, lan_id: 12)
puts "--- Done!"
