class LearningResourceSerializer
  include JSONAPI::Serializer
  attributes      :country,
                  :video,
                  :images,
                  :id
end