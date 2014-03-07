module ApplicationHelper
  def body_id
    controller.controller_name
  end

  # Ref: https://github.com/kpumuk/meta-tags
  def default_meta_tags
    {
      description: t("application.meta_tags.description"),
      keywords: t("application.meta_tags.keywords"),
      prefix: " ",
      reverse: true,
      site: t("application.name"),
      title: t("application.client.tagline"),
      open_graph: {
        description: t("application.meta_tags.description"),
        image: root_url + asset_path("logos/galaunia_farms_logo-400x400.png"),
        title: t("application.client.tagline"),
        type: :website,
        url: root_url,
      }
    }
  end
end
