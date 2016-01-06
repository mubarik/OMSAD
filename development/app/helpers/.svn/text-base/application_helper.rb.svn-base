module ApplicationHelper

  def self.insert_multiple_users(params,id,table_type)
    virtual_count = Integer(params[DynamicDivConstants::Virtual_Count])
    i=1
    while i<=virtual_count
       affiliation_text = ""
        i_s = i.to_s
        affiliation_type_index = DynamicDivConstants::Affiliation_Type+i_s

        if !params[affiliation_type_index].blank? and
           !params[affiliation_type_index].empty?

          affiliation_type = params[affiliation_type_index]

          if affiliation_type == DynamicDivConstants::External_Affiliation
            co_pi_name_index = DynamicDivConstants::External_Entity_Name+i_s

            if (!params[co_pi_name_index].blank? and
                !params[co_pi_name_index].empty?)
               co_pi_name = params[co_pi_name_index]
            end

            affiliation_text_index = DynamicDivConstants::Affiliation_Text+i_s

            if (!params[affiliation_text_index].blank? and
                !params[affiliation_text_index].empty?)
              affiliation_text = params[affiliation_text_index]
            end

          if table_type == DynamicDivConstants::Research_Grants
            FacultyMemberResearchGrant.add_coprinc_external(id,
                                                        co_pi_name,
                                                       affiliation_text,
                                                       affiliation_type)
          else
            UserPublication.create_user_publication('null',
                                                 id,
                                                 co_pi_name,
                                                 affiliation_text,
                                                 i,
                                                 affiliation_type)
          end

          else
            co_pi_id_index = DynamicDivConstants::Internal_Entity_Name+i_s

            if (!params[co_pi_id_index].blank? and
                !params[co_pi_id_index].empty?)
              co_pi_id = params[co_pi_id_index]
              co_pi    = User.find_by_id(co_pi_id);
              if !co_pi.blank?
                if table_type == DynamicDivConstants::Research_Grants
                  FacultyMemberResearchGrant.add_coprinc_internal(co_pi, id, affiliation_type)
                else
                  UserPublication.create_user_publication(co_pi.id,
                                                        id,
                                                        co_pi.name,
                                                        "LUMS",
                                                        i,
                                                        affiliation_type)
                end
              end
            end
          end
        end
        i = i+1
      end
  end

  def self.insert_multiple_teammembers(params,id)
    team_count = Integer(params[DynamicDivConstants::TeamVirtualCount])
    counter = 1
    while counter <= team_count
        counter_s = counter.to_s
        teammember_index = DynamicDivConstants::TeamMember_Name+counter_s
        designation_text_index = DynamicDivConstants::TeamMember_Designation+counter_s
        designation_text = ""

        if (!params[teammember_index].blank? and !params[teammember_index].empty?)
          team_member_id = params[teammember_index]
          if (!params[designation_text_index].blank? and !params[designation_text_index].empty?)
            designation_text = params[designation_text_index]
            
          end
          UserResearchGrant.add_team_members(team_member_id,id, designation_text)
        end
      
      counter= counter+1
     end
  end
end
