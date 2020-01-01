namespace :oneshot do
  desc "Modify ActionText::RichText.record_type"
  task modify_rich_text_record_type_20200102: :environment do
    ActionText::RichText.where(record_type: "Post").update_all(record_type: "Blg::Post")
  end
end
