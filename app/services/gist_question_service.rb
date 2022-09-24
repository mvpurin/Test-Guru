require 'octokit'

class GistQuestionService

	def initialize(question, client: nil)
		@question = question
		@test = @question.test
		@client = client || Octokit::Client.new(:access_token => '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')
	end

	def call
		@client.create_gist(gist_params)
	end

	private

	Octokit.configure do |c|
		c.api_endpoint = 'https://api.github.com'
	end

	def gist_params
		{
			description: "A question about #{@test.title} from TestGuru",
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
