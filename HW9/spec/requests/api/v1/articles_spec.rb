require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do
  path '/api/v1/articles' do
    get('list articles') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :search, in: :query, type: :string,
                description: 'пошук в статті по title або body'
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'пошук по статусу статті (published/unpublished)'
      parameter name: :name, in: :query, type: :string,
                description: 'пошук статті по автору'
      parameter name: :tags, in: :query, type: :string,
                description: 'пошук статті по тегу'
      parameter name: :order, in: :query, schema: { type: :string, enum: %w[asc desc] },
                description: 'сорторування статей (asc/desc)'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer },
          status: { type: :string }
        },
        required: %w[title body author_id status]
      }

      response(201, 'article created') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show article') do
      tags 'Articles'
      consumes 'application/json'

      response(200, 'successful') do
        let(:author) { create(:author) }
        let(:article) { create(:article, title: 'foo', author:) }
        let(:id) { article.id }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq('foo')
        end
      end

      response(404, 'article not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(406, 'unsupported accept header') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update article') do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          stutus: { type: :string }
        },
        required: %w[title body status]
      }

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(400, 'bad request') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'article not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'unprocessable entity') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(500, 'internal server error') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete article') do
      tags 'Articles'

      response(204, 'successful') do
        describe 'DELETE api/v1/articles{id}' do
          it 'should returns status response' do
            expect(response.status).to eq(204)
          end
          it 'delete article' do
            article.destroy
            expect(Article.find_by_id('id')).to eq(nil)
          end
        end
      end

      response(404, 'article not found') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
