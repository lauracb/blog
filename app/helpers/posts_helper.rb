module PostsHelper
    def form_title
        @post.new_record? ? "Crear Post" : "Actualizar"
    end

    def title
        @post.new_record? ? "Nuevo Post" : "Editar Post"
    end
end
