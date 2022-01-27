#!/usr/bin/env python
# coding: utf-8

# In[13]:


nums = list(range(30, 65, 5))
nums


# In[14]:


nums.reverse()
print(nums)


# In[16]:


nums.insert(0, 65)
print(nums)


# In[23]:


newlist = []
for item in range(0, 21):
    newlist.append(item)


# In[24]:


newlist


# In[25]:


newlist.remove(0)
newlist


# In[26]:


print(len(newlist))
print(max(newlist))
print(min(newlist))


# In[27]:


print(sum(newlist))


# In[38]:


weather = {'Sunny' : 'play',
          'Rainy': 'watch TV',
          'Cloudy': 'walk'}
for wtype, activity in weather.items():
    print(f'When {wtype} let us {activity}')


# In[39]:


weather['Snowy'] = 'ski'

for wtype, activity in weather.items():
    print(f'When {wtype} let us {activity}')

