defmodule BlogoWeb.Graphql.Resolvers.Tag do
  @moduledoc """
  Tag graphql resolver
  """
  alias Blogo.{Author, Post, Tags}
  alias Blogo.Repo.DataloaderRepo

  def get(_root, %{id: id}, _info) do
    case Tags.get(id) do
      nil -> {:error, "Tag not found"}
      tag -> {:ok, tag}
    end
  end

  def all(_root, _params, _info), do: {:ok, Tags.all()}

  def by_author(%Author{} = author, args, %{context: %{loader: loader}}),
    do: DataloaderRepo.by_parent(author, :tags, args, loader)

  def by_post(%Post{} = post, args, %{context: %{loader: loader}}),
    do: DataloaderRepo.by_parent(post, :tags, args, loader)
end
