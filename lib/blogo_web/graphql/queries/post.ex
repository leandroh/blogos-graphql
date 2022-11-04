defmodule BlogoWeb.Graphql.Queries.Post do
  @moduledoc """
  Post graphql queries
  """
  use Absinthe.Schema.Notation

  alias BlogoWeb.Graphql.Resolvers

  object :post_queries do
    @desc "Get post by id"
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Post.get/3)
    end

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Post.all/3)
    end
  end
end
