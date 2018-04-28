<div class="people-index-list">  
      <%= render 'search_form', { users: @users } %> 
      <div class="user-page">
        <%= render 'user_page', { users: @users } %>
      </div>
    </div>