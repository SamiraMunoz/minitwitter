module GraphqlHelper
  def gql(query, variables = nil)
    body = { query: query, variables: variables}

    post '/graphql', params: body

    JSON.parse(response.body)
  end
end
