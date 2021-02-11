namespace :oneshot do
  desc "Modify ActionText::RichText.record_type"
  task '20210211_modify_rich_text_record_type': :environment do
    ActionText::RichText.where(record_type: "Blg::Post").update_all(record_type: "Post")
  end
end
