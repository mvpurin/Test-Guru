require 'octokit'

class GistQuestionService

  attr_reader :client

	def initialize(question, client: nil)
		@question = question
		@test = @question.test
		@client = client || Octokit::Client.new(access_token: ENV['GITHUB_GISTS_ACCESS_TOKEN'])
	end

	def call
		@client.create_gist(gist_params)
	end

  def success?
    self.client.last_response.status == 201
  end

	private

	Octokit.configure do |c|
		c.api_endpoint = 'https://api.github.com'
	end

	def gist_params
		{
			description: I18n.t('services.gist_question.gist_params.question_about', test_title: @test.title),
			files: {
				'test-guru-question.txt' => {
					content: gist_content
				}
			}
		}
	end

	def gist_content
		content = [@question.body]
		content += @question.answers.pluck(:body)
		content.join("\n")
	end

end
