module Linkable
  EXPRESSION = /(?<=\A|\s)(((\w+\:)??\/\/)?(([\w\-]+\.){1,}[\w\-]+)(\/[^\? ]+)?([^\s]+)?)(?=\z|\s)/
end