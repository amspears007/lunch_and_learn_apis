class RecipeSerializer
  include JSONAPI::Serializer
  attributes  :title,
              :url,
              :country,
              :image,
              :id
              # or can set_id {nil}  its been set to nil in poros
end