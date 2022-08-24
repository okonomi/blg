# via: https://github.com/rails/rails/pull/35885

module ActionTextHelper
  def fill_in_rich_text_area(locator, with:)
    page.execute_script(<<~JS, find(:rich_text_area, locator).native, with.to_s)
      const [element, html] = arguments;
      element.editor.loadHTML(html);
    JS
  end
end

Capybara.add_selector :rich_text_area do
  label "rich-text area"
  xpath do |locator|
    input_located_by_name = XPath.anywhere(:input).where(XPath.attr(:name) == locator).attr(:id)

    XPath.descendant(:"trix-editor").where \
      XPath.attr(:id).equals(locator) |
      XPath.attr(:placeholder).equals(locator) |
      XPath.attr(:"aria-label").equals(locator) |
      XPath.attr(:input).equals(input_located_by_name)
  end
end
