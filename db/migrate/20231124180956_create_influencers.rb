class CreateInfluencers < ActiveRecord::Migration[7.1]
  def change
    create_table :influencers, id: :uuid do |t|
      t.integer :influence_type
      t.integer :referral_count
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :influencers, :influence_type
  end
end
