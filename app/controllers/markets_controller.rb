class MarketsController < ApplicationController

  helper :members_menu
  
  def index
    @organization = S4::Organization.find(s4_user)
    @user = s4_user
    @resource = S4::Resource
    @id = params[:id]

    @resource.resource_type = :market_agent_link
    marketAgentLinks = @resource.all(s4_user)

    @marketsIdsArray = @organization.market_groups.select{ |market_group| market_group.id == params[:id] }
    @marketsIdsArray.each{ |market_group|
      market_group.markets.collect{|market|
        agentLink = marketAgentLinks.find{ |agents| agents.market == market.id }
        agentLink = agentLink.agent_resource.to_sym

        @resource.resource_type = agentLink
        users = @resource.all(s4_user)
        market.schema  = @resource.schema.clone
        market.schema.columns.delete_if{|column| column.name == 'id'}
        market.users = users
        @resource.resource_type = :market_clearing_info
        market.clearing = @resource.all(s4_user).find{|clearing| clearing.id == market.id}.description rescue ::Formtastic::I18n.t('no_word')
      }
    }
  end

  def show
    @organization = S4::Organization.find(s4_user)
    @market = @organization.markets.find { |market| market.to_param == params[:id] }
    @agents = @market.agents
  end
  
end