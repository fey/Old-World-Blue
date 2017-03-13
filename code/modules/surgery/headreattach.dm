//This is an uguu head restoration surgery TOTALLY not yoinked from chinsky's limb reattacher
/datum/surgery_step/attach_head/
	priority = 3 // Must be higher than /datum/surgery_step/internal
	allowed_tools = list(/obj/item/organ/external/head = 100)
	can_infect = 0

	min_duration = 80
	max_duration = 100

	can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/head = target.get_organ(target_zone)
		return isnull(head) && target_zone == BP_HEAD && !isnull(target.species.has_limbs[BP_HEAD])

	begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		user.visible_message(
			"[user] starts attaching [tool] to [target]'s neck.",
			"You start attaching [tool] to [target]'s neck."
		)

	end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		user.visible_message(
			NOTICE("[user] has attached [target]'s head to the body."),
			NOTICE("You have attached [target]'s head to the body.")
		)
		var/obj/item/organ/external/head = tool
		user.drop_from_inventory(head)
		head.install(target)
		head.status = 0
		target.update_body()
		target.update_hair()
		target.updatehealth()
		target.UpdateDamageIcon()

	fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		user.visible_message(
			WARNING("[user]'s hand slips, damaging [target]'s neck!"),
			WARNING("Your hand slips, damaging [target]'s neck!")
		)
		target.apply_damage(10, BRUTE, null, sharp=1)
