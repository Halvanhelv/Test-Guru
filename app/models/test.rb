class Test < ApplicationRecord

  def self.test_sort(name)
    Test.joins('join categories on categories.id = tests.category_id')
        .where('categories.title = ?', name).order(title: :desc).pluck(:title)
  end
end
