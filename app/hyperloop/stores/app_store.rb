class AppStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self

    def section_stores
      @section_stores
    end

    def loading_error!
      @loading_error = true
    end

    def errors?
      @loading_error
    end

    def loaded?
      are_all_stores_loaded?
    end

    private

    def init
      @section_stores = {}
      @loading_error = false
      mutate.stores_all_loaded false
      load_overview_section
      load_start_section
      load_dsl_section
      load_installation_section
      load_tools_section
      load_tutorials_section
    end

    def are_all_stores_loaded?
      @section_stores.each do |section_hash|
        return false unless section_hash[1].loaded?
      end
      true
    end

    def load_overview_section
      section_name = 'docs_overview'
      display_name = 'Overview'

      pages = [
        { id: 0, name: 'overview', repo: 'hyperstack-website', file: 'app/docs/docs_overview.md',  allow_edit: true },
      ]
      @section_stores[section_name] = SectionStore.new(exclude_from_toc: true, pages: pages,
                                                      section_name: section_name, display_name: display_name)
    end

    def load_start_section
      section_name = 'start'
      display_name = 'Getting Started'

      pages = [
        { id: 0, name: 'components', repo: 'hyperstack-website',     file: 'app/docs/start/components.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyperstack-website',     file: 'app/docs/start/stores.md',  allow_edit: true },
        { id: 2, name: 'models', repo: 'hyperstack-website',     file: 'app/docs/start/models.md',  allow_edit: true },
        { id: 3, name: 'operations', repo: 'hyperstack-website',     file: 'app/docs/start/operations.md',  allow_edit: true },
        { id: 4, name: 'policies', repo: 'hyperstack-website',     file: 'app/docs/start/policies.md',  allow_edit: true },
        { id: 5, name: 'pradgmatic', repo: 'hyperstack-website',     file: 'app/docs/start/pradgmatic.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
    end

    def load_dsl_section
      section_name = 'dsl'
      display_name = 'Hyperstack DSL'

      pages = [
        { id: 0, name: 'components', repo: 'hyperstack-client',     file: 'docs/hyper-component.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyperstack-client',     file: 'docs/hyper-store.md',  allow_edit: true },
        { id: 2, name: 'models', repo: 'hyperstack-client',      file: 'docs/hyper-model.md',  allow_edit: true },
        { id: 3, name: 'router', repo: 'hyperstack-client',    file: 'docs/hyper-router.md',  allow_edit: true },
        { id: 4, name: 'operations', repo: 'hyperstack-client', file: 'docs/hyper-operation.md',  allow_edit: true },
      ]
      @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
    end

    def load_installation_section
      section_name = 'installation'
      display_name = 'Installation & Setup'

      pages = [
        { id: 0, name: 'installation', repo: 'hyperstack-website', file: 'app/docs/installation/overview.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
    end

    def load_tools_section
      section_name = 'tools'
      display_name = 'Tools, Tips & Debugging'

      pages = [
        { id: 0, name: 'tools', repo: 'hyperstack-website', file: 'app/docs/tools/tools.md',  allow_edit: true },
        { id: 1, name: 'tips', repo: 'hyperstack-website', file: 'app/docs/tools/tips.md',  allow_edit: true },
        { id: 2, name: 'debugging', repo: 'hyperstack-website', file: 'app/docs/tools/debugging.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
    end

    def load_tutorials_section
      section_name = "tutorials"
      display_name = "Tutorials"

      pages = [
        { id: 0, name: 'helloworld', repo: 'hyperstack-website', file: 'app/docs/tutorial/helloworld.md',  allow_edit: true },
        { id: 1, name: 'todo', repo: 'hyperstack-website', file: 'app/docs/tutorial/todo.md',  allow_edit: true },
        { id: 3, name: 'community', repo: 'hyperstack-website', file: 'app/docs/tutorial/community.md',  allow_edit: true }

      ]
      @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
    end
  end

end