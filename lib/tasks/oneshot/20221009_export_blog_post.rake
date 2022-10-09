# frozen_string_literal: true

namespace :oneshot do
  desc ""
  task "20221009_export_blog_post": :environment do
    require "reverse_markdown"
    require "fileutils"

    FileUtils.mkdir_p Rails.root.join("tmp/transfer/posts")

    Post.includes(:rich_text_content).published.find_each do |post|
      post = ActiveDecorator::Decorator.instance.decorate(post)

      # 記事本文取得
      content = post.content.to_s

      # markdownに変換
      md = ReverseMarkdown.convert(content, github_flavored: true)

      md.gsub!(/  $/, "")
      md.gsub!(/\n{3,}/m, "\n\n")
      md.gsub!(/\n+$/m, "\n")

      # .mdに保存
      path = Rails.root.join("tmp/transfer/posts/#{post.uid}.md")
      File.open(path, "w") do |f|
        f.write(<<~"FRONTMATTER")
          ---
          layout: "../../layouts/BlogPost.astro"
          title: "#{(post.title.presence || "no title").gsub('"', '\"')}"
          pubDate: "#{post.published_date}"
          ---
        FRONTMATTER

        f.write(md)
      end
    end
  end
end
