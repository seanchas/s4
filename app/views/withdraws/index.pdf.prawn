<%= stylesheet_link_tag("authority") %>
<%= stylesheet_link_tag("formstyling") %>
<%= javascript_include_tag("authority") %>

<h1 class="authority_header"><%= t(:menu_title, :scope => [:shared, :senddocument]) %></h1>

<%= contextual_menu %>

<%= error_messages_for :authority %>
<div class="authority formstyling">
<% form_for @authority, :url => withdraw_path(@authority, :format => 'pdf') do |f| %>
<div class="l-field">
    <p>
      <span class="star">*</span>
      <span class="label_span"><%= f.label :type_id, t(:type_label, :scope => [:shared, :authority, :columns]), :class => "required" %></span>
      <%= f.select(:type_id, @warrant_types.collect {|warrant_type| [warrant_type.name, warrant_type.id]}, {:include_blank => ''}) %>
    </p>
  </div>
  <div class="l-field">
    <p>
      <span class="star">*</span>
      <span class="label_span"><%= f.label :user_id, t(:user_label, :scope => [:shared, :authority, :columns]), :class => "required" %></span>
      <%= f.select(:user_id, @warrant_agents.collect {|warrant_agent| [warrant_agent.name, warrant_agent.id]}, {:include_blank => 'Новый пользователь'}) %>
  </p>
  </div>
  <div class="l-field">
    <p>
      <span class="label_span"><%= f.label :lastname, t(:new_lastname_label, :scope => [:shared, :authority, :columns]) %></span>
      <%= f.text_field :lastname %>
  </p>
  </div>
  <div class="l-field">
    <p>
      <span class="label_span"><%= f.label :firstname, t(:new_firstname_label, :scope => [:shared, :authority, :columns]) %></span>
      <%= f.text_field :firstname %>
  </p>
  </div>
  <div class="l-field">
    <p>
      <span class="label_span"><%= f.label :middlename, t(:new_middlename_label, :scope => [:shared, :authority, :columns]) %></span>
      <%= f.text_field :middlename %>
    </p>
  </div>
  <div class="l-field">
    <p>
      <span class="label_span"><%= f.label :position, t(:new_position_label, :scope => [:shared, :authority, :columns]) %></span>
      <%= f.text_field :position %>
  </p>
  </div>
  <div class="submit">
    <p>
      <span class="label_span">&nbsp;</span>
      <%= f.submit t(:create_button, :scope => [:shared, :authority]) %>
   </p>
  </div>
<% end %>
</div>
<div class="legend">
    <p>
        <label>&nbsp;</label>
         <span class="star">*</span>
        Обязaтельные для заполнения поля
    </p>
</div>
