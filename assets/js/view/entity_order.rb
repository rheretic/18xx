# frozen_string_literal: true

require 'engine/player'

class EntityOrder < Snabberb::Component
  needs :round

  def render
    divs = @round.entities.map.with_index do |entity, index|
      style = {
        display: 'inline-block',
        margin: '0 5px 5px 0',
        'padding-left': '5px',
      }
      style['text-decoration'] = 'underline' if @round.can_act?(entity)
      style['border-left'] = 'black solid thin' if index.positive?

      owner = " (#{entity.owner.name})" if !entity.is_a?(Engine::Player) && entity.owner
      h(:div, { style: style }, "#{entity.name}#{owner}")
    end

    h(:div, divs)
  end
end