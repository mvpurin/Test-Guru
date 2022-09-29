require 'octokit'

class GistQuestionService

	def initialize(question, client: nil)
		@question = question
		@test = @question.test
		@client = client || Octokit::Client.new(:access_token => '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')
		@@client = @client
	end

	def call
		@client.create_gist(gist_params)
	end

	def self.client
		@@client
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
