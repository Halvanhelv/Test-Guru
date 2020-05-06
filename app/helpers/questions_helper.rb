module QuestionsHelper
  def question_header(resource)
    if resource.persisted?
      "Edit #{resource.test.title} Question"
    else
      "Create New #{resource.test.title} Question"
    end
  end
end
