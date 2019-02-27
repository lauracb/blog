module PostsHelper
    def form_title
        @post.new_record? ? "Crear" : "Actualizar"
    end

    def title
        @post.new_record? ? "Nuevo Post" : "Editar Post"
    end
end
